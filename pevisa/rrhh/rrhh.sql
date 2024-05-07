select *
  from planilla10.t_cargo
 where c_cargo = 'AP';

select *
  from planilla10.t_area
 order by c_area;

select *
  from planilla10.personal
 where apellido_paterno = 'ALVITES'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.ingre_fijo
 where c_concepto = '1001'
   and c_codigo = 'E1138';

select *
  from planilla10.t_cargo
 where c_cargo = 'OPAL';

select *
  from planilla10.personal
 where c_codigo = 'E017';

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
 where c_codigo = 'E640';

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
 where id_alterno = :p_usuario and id_modulo = :modulo;

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

select *
  from vw_analpla_personal_total
 where c_area = '007';

select c_codigo, nombre, sexo, c_cargo, desc_cargo, f_ingreso, fnatal, desc_doc, num_doc, email
     , email_p, edad
     , anos_empresa, anos_aniversario, desc_seccion, c_area, dsc_area, c_encargado, desc_encargado
     , usuario_encargado, email_encargado, desc_local, f_cese, sector, desc_sector, situacion
     , horario
     , desc_horario, turno
  from vw_personal
 where flg_planta = 1
   and situacion not in ('8', '9')
--    and sector in ('10', '20', '40', '80', '30')
   and c_codigo = 'E424';

select *
  from planilla10.t_sector
 where c_sector in ('10', '20', '40', '80', '30');

select *
  from planilla10.t_sector
 where c_sector = '90';

select * from motivo_cese_sunat;

select * from cese_personal;

select *
  from detalle_cese
 order by id_detalle;

select *
  from evaluacion
 where id_evaluacion = 8173;

select * from estado_evaluacion;

select * from planilla10.tar_encarga;

select *
  from planilla10.personal
 where encargado = '039'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.personal
 where encargado = '060';

select *
  from evaluacion
 where id_evaluado = 'E41962'
 order by fecha desc;

select *
  from vw_personal
where nombre like '%MANGO%';

select * from planilla10.personal
where apellido_paterno like '%NINiwA%';

select *
  from evaluacion
 where id_evaluacion in (
                         8356, 8374, 8372, 8373
   );

select cod_art, detalle from tmp_carga_data;

select *
  from planilla10.tar_secc
 where codigo = '03';

select *
  from planilla10.personal
 where c_codigo = 'E42625';

select sysdate from dual;

select *
  from planilla10.tar_encarga
 where nombre like '%VILLON%';


select *
  from planilla10.personal
 where c_codigo in (
                    'E42625', 'E1137', 'E1139'
   );

declare
  i pls_integer := 0;

  cursor cr_limpieza is
    select cod_art as cod_personal, detalle as seccion from tmp_carga_data;
begin
  for r in cr_limpieza loop
    update planilla10.personal
       set seccion = r.seccion
     where c_codigo = r.cod_personal;
    i := i + sql%rowcount;
  end loop;
  dbms_output.put_line(i);
end;
