select *
  from planilla10.t_cargo
 where c_cargo = 'AP';

select *
  from planilla10.t_area
 order by c_area;

select *
  from planilla10.personal
 where apellido_paterno like '%CRUZ%'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.personal
 where apellido_paterno like '%INFANTE%';

select *
  from planilla10.ingre_fijo
 where c_concepto = '1001'
   and c_codigo = 'E1198';

select *
  from planilla10.t_cargo
 where c_cargo = 'SPS';

select * from vw_personal;

select p.c_codigo as codigo, p.nombre, p.email, p.email_p
  from vw_personal p
 where p.c_codigo in (
                      'E1177', 'E786', 'E4034', 'E419', 'E1116', 'E1085', 'E687', 'E792', 'E410',
                      'E744', 'E748', 'E156', 'E144', 'E868', 'E784', 'E720', 'E802', 'E185',
                      'E1103', 'E165', 'E893', 'E360', 'E1037', 'E912', 'E869', 'E1128', 'E822',
                      'E450', 'E664', 'E969', 'E727', 'E422', 'E324', 'E887', 'E691', 'E1115',
                      'E873', 'E1021', 'E303', 'E591', 'E862', 'E421', 'E440', 'E588', 'E722',
                      'E698', 'E665', 'E1038', 'E420', 'E492', 'E815', 'E577', 'E1027', 'E926',
                      'E1153', 'E719', 'E1112', 'E874', 'E762', 'E1124', 'E974', 'E1127', 'E731',
                      'E931'
   )
 order by nombre;

select *
  from planilla10.hr_personal
 where c_codigo = :p_personal;

select *
  from planilla10.doc_per
 where c_codigo = 'E532';

select *
  from planilla10.vw_utilidades_correos;

select *
  from proceso_puntualidad
 order by id_proceso desc;

select *
  from proceso_puntualidad_pers
 where id_personal = 'E41298'
 order by id_proceso desc;

select * from concepto_permiso;

select *
  from permiso
 where id_concepto = 'PTD'
   and id_personal = 'E41298'
 order by fecha desc;

begin
  puntualidad.automatico(2024, 4);
end;

select * from planilla10.plcontrol;

select *
  from planilla10.personal
 where c_codigo = 'E640';

select *
  from permiso
 where numero = 66835;

select *
  from evaluacion
 where id_evaluacion in (8466, 8480);

select * from estado_evaluacion;

select * from estado_evaluacion;

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
        exists (
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

select *
  from planilla10.personal
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
 where nombre like '%QUISPE%' or nombre like '%CONTRERAS%';

select *
  from planilla10.tar_encarga
 where nombre like '%NAVARRO%';
select *
  from planilla10.personal
 where encargado = '034';

update planilla10.personal
   set encargado = '034'
 where encargado = '048';

select *
  from planilla10.personal
 where c_codigo in (
                    'E43034', 'E43262', 'E42956', 'E42840', 'E43242', 'E43082', 'E43254', 'E4034',
                    'E42501', 'E41936', 'E42509', 'E42637', 'E42936', 'E41298', 'E42827', 'E43148',
                    'E42567', 'E42171', 'E43253', 'E43313', 'E42077', 'E42381', 'E4918', 'E43204',
                    'E43246', 'E42088', 'E42519', 'E43297'
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

select * from estado_accidente;

select * from accidente;

select *
  from permiso
 where numero = 64191;

select * from estado_permiso;

-- puestos trabajadores
select c_codigo, nombre, desc_cargo, desc_seccion, desc_local
  from vw_personal
 where situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
 order by nombre;


select *
  from vw_personal
 where nombre like '%CATALAN%';

-- correo de personal por sede
select nombre, desc_cargo, email, desc_seccion, dsc_area
  from vw_personal
 where desc_local = 'SEDE VULCANO'
   and email like '%pevisa%'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
 order by dsc_area;

select *
  from planilla10.personal
 where apellido_paterno = 'CARDENAS'
   and nombres like '%ESTEFANY%';

select *
  from cese_personal
 where id_personal = 'E41990';

select * from motivo_cese_sunat;

select * from detalle_cese order by id_detalle;

select *
  from usuario_modulo_alterno
 where id_modulo = 'VACACIONES'
   and id_usuario = 'CNINAMANGO';

select *
  from usuario_modulo_alterno
 where id_modulo = 'VACACIONES'
   and id_alterno = 'DNUNEZM';

select *
  from vacaciones
 where numero = 19615;

-- capacitaciones que paga la empresa
  with capa as (
    select c.id_capacitacion, c.id_tema, c.referencia, e.id_empleado
         , c.inicio, c.fin, p.meses, add_months(c.fin, p.meses) as permanencia
      from capacitacion c
           join capacitacion_empleado e
                on c.id_capacitacion = e.id_capacitacion
           left join vw_permanencia_rango p
                     on e.id_permanencia = p.id_permanencia
                       and e.id_rango = p.id_rango
     where c.id_lugar = 5
       and e.costo_empresa > 0
     order by inicio desc
    )
select listagg(c.id_capacitacion, ' | ') within group ( order by c.id_capacitacion) as capas
  from capa c
 where :p_cese between c.inicio and coalesce(c.permanencia, c.fin)
   and c.id_empleado = :p_empleado;

begin
  dbms_output.put_line(capacita.permanencia_pendiente(p_fch => sysdate, p_emp => 'E640'));
end;

begin
  cesepersonal.envia_correo(p_id_personal => 'E640', p_cese => sysdate, p_motivo => 2);
end;


select * from motivo_cese_sunat;

select *
  from vw_permanencia_rango
 where id_permanencia = 1
   and id_rango = 7;

select *
  from capacitacion c
       join capacitacion_empleado e on c.id_capacitacion = e.id_capacitacion
 where c.id_lugar = 5
   and e.costo_empresa > 0
 order by inicio desc;


-- E43006

select *
  from vw_personal
 where c_codigo = 'E43006';


select porcentaje_neto
  from comision_ingeniero_asigna
 where cod_personal in ('E4526', 'E1104', 'E957')
   and cod_tipo in ('ME', 'SE');

select porcentaje_neto
  from comision_ingeniero_asigna
 where cod_personal in ('E012')
   and cod_tipo in ('ME', 'SE');

select b.descripcion as desc_tipo, a.descripcion as desc_premio
  from comision_ingeniero_tab a
     , ger_nac_tipo_comision b
 where a.cod_tipo = b.cod_tipo
   and a.cod_tipo = :comision_ingeniero_asigna.cod_tipo
   and a.cod_premio = :comision_ingeniero_asigna.cod_premio;

select * from comision_ingeniero_tab;

select *
  from amonestacion
 where numero in (485, 484);
