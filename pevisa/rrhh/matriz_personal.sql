select p.c_codigo, p.apellido_paterno || ' ' || p.apellido_materno || ', ' || p.nombres as nombre
     , p.c_cargo, c.descripcion as desc_cargo, p.seccion, s.nombre as desc_seccion
     , g.c_codigo as encargado, p.sexo, g.nombre as desc_encargado, h.local
     , l.descripcion as desc_local, p.f_ingreso, p.fnatal, d.num_doc as dni
     , i.descripcion as situacion, p.f_cese, p.conini, p.confin
     , trunc(months_between(sysdate, p.fnatal) / 12) as edad,
  trunc(months_between(sysdate, p.f_ingreso) / 12) || ' años' as tiempo_empresa, e.desc_perfil
     , e.ultimo_emo, e.proximo_emo, e.desc_perfil_covid, e.ultimo_covid, e.proximo_covid
     , e.desc_perfil_toxi, e.ultimo_toxi, e.proximo_toxi, u.talla_polo, u.talla_pantalon
     , u.talla_calzado
  from planilla10.personal p
       left join planilla10.t_cargo c on p.c_cargo = c.c_cargo
       left join planilla10.tar_secc s on p.seccion = s.codigo
       left join planilla10.tar_encarga g on p.encargado = g.codigo
       left join planilla10.doc_per d on p.c_codigo = d.c_codigo and d.c_doc = 'LE'
       left join planilla10.hr_personal h on p.c_codigo = h.c_codigo
       left join planilla10.pla_local l on h.local = l.local
       left join planilla10.t_situacion i on p.situacion = i.codigo
       left join vw_trabajador_emo e on p.c_codigo = e.c_codigo
       left join tmp_uniforme u on p.c_codigo = u.id_personal
 where (upper(g.usuario) in (
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
 order by 2;

select *
  from usuario_modulo
 where modulo = 'MATRIZ_PERSONAL'
   and usuario = 'DNUNEZM';

select *
  from usuario_modulo
 where modulo = 'PERMISO'
   and usuario = 'DNUNEZM';

select *
  from usuario_modulo_alterno
 where id_alterno = 'DNUNEZM'
   and id_modulo = 'PERMISO';

select *
  from usuario_modulo_alterno
 where id_modulo = 'MATRIZ_PERSONAL';