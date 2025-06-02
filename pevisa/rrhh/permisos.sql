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
 where id_modulo = 'PERMISO';

-- SVAGAS
-- JVILLON
-- YORGAN ACUÑA

select *
  from modulo
 where id_modulo = 'EVALUACION';

select *
  from planilla10.tar_encarga;

select * from concepto_permiso;

select *
  from asistencia.concepto
 where cod_concepto = 'ENFGT';

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
 where numero in (66855, 66854);

select *
  from proceso_puntualidad_pers
 where id_personal = 'E4376'
 order by id_proceso desc;

select * from proceso_puntualidad_pers;

select * from proceso_puntualidad_permiso;

select * from estado_permiso;

select * from vw_permisos;

select count(*)
  from permiso
 where id_personal = 'E42422'
   and trunc(desde) = to_date('10/04/2024', 'dd/mm/yyyy')
   and id_concepto = 'DMS'
 order by fecha desc;

select *
  from concepto_permiso;

select *
  from cominac_concepto_venta_grupal
 where cod_concepto = 192;

select *
  from concepto_permiso
 where flg_asocial = 1;

select *
  from concepto_permiso
 where flg_solorrhh != 1;

select *
  from usuario_modulo
 where usuario = 'CNAVARRO'
   and modulo = 'PERMISO';

-- tentativo
select descripcion as dsc_concepto, id_concepto as idconcepto
  from pevisa.concepto_permiso
 where ((:maestro = 'NO' and flg_solorrhh = 0 and not exists (
   select rm.id_permiso, p.dsc_permiso
     from usuarios u
          join roles r on u.id_rol = r.id_rol
          join roles_modulo rm on r.id_rol = rm.id_rol
          join permisos p on rm.id_permiso = p.id_permiso
    where u.usuario = :usuario
      and rm.id_modulo = 'PERMISO'
      and p.id_permiso in (20)
   )) or
        (flg_asocial = 1 and exists (
          select rm.id_permiso, p.dsc_permiso
            from usuarios u
                 join roles r on u.id_rol = r.id_rol
                 join roles_modulo rm on r.id_rol = rm.id_rol
                 join permisos p on rm.id_permiso = p.id_permiso
           where u.usuario = :usuario
             and rm.id_modulo = 'PERMISO'
             and p.id_permiso in (20)
          )) or
        :maestro = 'SI')
 order by descripcion;

-- final en base a roles
select descripcion as dsc_concepto, id_concepto as idconcepto
  from pevisa.concepto_permiso
 where ((exists (
   select rm.id_permiso, p.dsc_permiso
     from usuarios u
          join roles r on u.id_rol = r.id_rol
          join roles_modulo rm on r.id_rol = rm.id_rol
          join permisos p on rm.id_permiso = p.id_permiso
    where u.usuario = :usuario
      and rm.id_modulo = 'PERMISO'
      and p.id_permiso = 0
   )) or
        (flg_asocial = 1 and exists (
          select rm.id_permiso, p.dsc_permiso
            from usuarios u
                 join roles r on u.id_rol = r.id_rol
                 join roles_modulo rm on r.id_rol = rm.id_rol
                 join permisos p on rm.id_permiso = p.id_permiso
           where u.usuario = :usuario
             and rm.id_modulo = 'PERMISO'
             and p.id_permiso = 20
          )) or
        flg_solorrhh != 1 and not exists (
          select rm.id_permiso, p.dsc_permiso
            from usuarios u
                 join roles r on u.id_rol = r.id_rol
                 join roles_modulo rm on r.id_rol = rm.id_rol
                 join permisos p on rm.id_permiso = p.id_permiso
           where u.usuario = :usuario
             and rm.id_modulo = 'PERMISO'
             and p.id_permiso in (0, 20)
          ))
 order by descripcion;

select * from concepto_permiso;

select rm.id_permiso, p.dsc_permiso
  from usuarios u
       join roles r on u.id_rol = r.id_rol
       join roles_modulo rm on r.id_rol = rm.id_rol
       join permisos p on rm.id_permiso = p.id_permiso
 where u.usuario = 'CNAVARRO'
   and rm.id_modulo = 'PERMISO'
   and p.id_permiso in (20);


select * from usuarios;

select * from tab_menu;

select * from modulo;

select * from concepto_permiso;

--------------------------
select * from roles_menus;

select * from menu_roles;
--------------------------

select * from menu; -- por crear

create public synonym accesos for pevisa.accesos;

select *
  from permiso
 where numero in (66855, 66854);


select *
  from permiso
 where numero = 63652;

select *
  from proceso_puntualidad_pers
 where id_personal = 'E4376'
   and horas_libres_saldo > 0
 order by id_proceso desc;

select * from proceso_puntualidad_pers;

select * from proceso_puntualidad_permiso;

begin

  for r in (
    select id_proceso, id_personal, permiso_ser, permiso_nro, horas_usadas
      from proceso_puntualidad_permiso
     where permiso_ser = 1
       and permiso_nro = 63652
    )
  loop
    update proceso_puntualidad_pers
       set horas_libres_saldo = horas_libres_saldo + r.horas_usadas
     where id_proceso = r.id_proceso
       and id_personal = r.id_personal;

    delete
      from proceso_puntualidad_permiso
     where id_proceso = r.id_proceso
       and id_personal = r.id_personal
       and permiso_ser = r.permiso_ser
       and permiso_nro = r.permiso_nro;
  end loop;

end;

begin
  puntualidad.reclama_hr('E4376', 6);
end;

  with det as (
    select p.id_proceso, e.id_personal, e.horas_libres_saldo
         , sum(e.horas_libres_saldo) over (order by p.hasta) as saldo_acumulado
      from proceso_puntualidad p
           join proceso_puntualidad_pers e on p.id_proceso = e.id_proceso
     where id_personal = :p_persona_id
       and e.horas_libres_saldo != 0
     order by hasta
    )
select d.id_proceso, d.id_personal, d.horas_libres_saldo, d.saldo_acumulado
     , d.saldo_acumulado - d.horas_libres_saldo as acumulado_anterior
     , greatest(d.saldo_acumulado - :p_horas, 0) as saldo_final
     , case
         when d.saldo_acumulado <= :p_horas then
           d.horas_libres_saldo
         when d.saldo_acumulado - horas_libres_saldo < :p_horas then
           :p_horas - (d.saldo_acumulado - d.horas_libres_saldo)
         else 0
       end as consumo_distribuido
  from det d
-- running total for previous row is less than :p_horas then include current row
 where d.saldo_acumulado - d.horas_libres_saldo < :p_horas;


select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion, enc.c_codigo as cod_jefe
     , enc.nombre as encargado
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and (upper(enc.usuario) in (
   select usuario
     from usuario_modulo
    where usuario = :user and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = :modulo
   ) or :user in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and per.situacion not in ('8', '9')
 order by per.apellido_paterno;


select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and (upper(enc.usuario) in (
   select usuario
     from usuario_modulo
    where usuario = :user and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = :modulo
   ) or :user in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and per.situacion not in ('8', '9')
 order by per.apellido_paterno;

select *
  from concepto_permiso
 where id_concepto = 'LCG';

begin
  bienestar.tiempo_permiso_ok(
      'NAM'
    , to_date('24/12/2024 20:45', 'dd/mm/yyyy hh24:mi')
    , to_date('24/12/2024 23:45', 'dd/mm/yyyy hh24:mi')
  );
end;

select *
  from concepto_permiso
 where descripcion like '%NUEVO%';

select *
  from permiso
 where numero = 69873;

  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, o.email, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.hr_personal o on p.c_codigo = o.c_codigo
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
    )
     , jerarquia(c_codigo, nombres, apellido_paterno, c_jefe) as (
    select e.c_codigo, e.nombres, e.apellido_paterno, c_jefe
      from empleados e
     where e.c_codigo = :p_codemp
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from jerarquia b
           join empleados e on b.c_jefe = e.c_codigo
     where e.c_codigo != e.c_jefe
    )
select b.c_jefe, e.nombres, e.apellido_paterno, e.email
  from jerarquia b
       join empleados e on b.c_jefe = e.c_codigo
 where e.apellido_paterno not in ('WOLFENZON', 'LEVY');

select *
  from vw_personal
 where nombre like '%GUEVARA%';
