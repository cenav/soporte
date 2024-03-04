select *
  from planilla10.t_cargo
 where c_cargo = 'AP';

select *
  from planilla10.t_area
 order by c_area;

select *
  from planilla10.personal
 where apellido_paterno = 'GARCIA'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.ingre_fijo
 where c_concepto = '1001'
   and c_codigo = 'E1083';

select *
  from planilla10.t_cargo
 where c_cargo = 'OPAL';

select *
  from planilla10.personal
 where c_codigo = 'E123';

select *
  from planilla10.doc_per
 where c_codigo = 'E532';

select *
  from planilla10.vw_utilidades_correos;

begin
  puntualidad.automatico(2023, 4);
end;

select * from planilla10.plcontrol;

select *
  from planilla10.personal
 where apellido_paterno like 'ZA%';

select *
  from planilla10.personal
 where c_codigo = 'E41311';

select *
  from permiso
 where numero = 59050;

select *
  from evaluacion
 where id_evaluacion = 8022;

select *
  from usuario_modulo
 where usuario = 'JCABEZAS';

select *
  from usuario_modulo
 where modulo in ('VACACIONES', 'PERMISO')
   and usuario = 'JQUISPEB';

select *
  from usuario_modulo_alterno
 where id_alterno = 'JQUISPEB';


select *
  from usuario_modulo u
 where ((u.modulo = :p_modulo and u.usuario = :p_usuario) or
        exists(
          select 1
            from usuario_modulo_alterno a
           where u.usuario = a.id_usuario
             and u.modulo = a.id_modulo
             and u.modulo = :p_modulo
             and a.id_alterno = :p_usuario
          )
   )
   and rownum = 1;

select usuario, modulo, maestro, supermaestro
  from usuario_modulo
 where usuario = :p_usuario and modulo = :modulo
 union
select id_usuario, id_modulo, id_alterno
  from usuario_modulo_alterno
 where id_alterno = :p_usuario and id_modulo = :modulo

select *
  from vw_permisos
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
   and (cod_encargado = :encargado or :encargado is null)
   and (id_estado = :estado or :estado is null)
   and (id_concepto = :concepto or :concepto is null)
   and (numero = :numero or :numero is null)
   and (fecha between :fecha_del and :fecha_al or
        (:fecha_del is null and :fecha_al is null));

select * from planilla10.tar_encarga;