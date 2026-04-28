select *
  from planilla10.personal
 where nombres like '%YANELY%'
   and apellido_paterno like '%LIFONSO%'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.personal
 where extract(year from f_ingreso) = 2026
   and extract(month from f_ingreso) = 4;


select *
  from vw_personal
 where extract(year from f_ingreso) = 2026
   and extract(month from f_ingreso) = 4;

select *
  from planilla10.personal
 where nombres like '%RAFAEL%'
   and apellido_paterno like '%TELLO%';


select *
  from planilla10.t_cargo
 where c_cargo = 'AXAM';

select *
  from planilla10.t_area
 order by c_area;

select *
  from vw_personal
 where c_codigo = 'E961';

select *
  from planilla10.personal
 where nombres like '%VICTOR%'
   and apellido_paterno like '%REYMUNDO%';

select *
  from planilla10.ingre_fijo
 where c_concepto = '1001'
   and c_codigo = 'E42015';


select *
  from planilla10.ingre_fijo
 where c_concepto = '1001'
   and valor = 8000;


select *
  from planilla10.ingre_fijo
 where c_codigo = 'E1188';

select *
  from planilla10.t_cargo
 where c_cargo = 'SPS';

select *
  from vw_personal
 where c_codigo like '';

select *
  from planilla10.tar_encarga
 where c_codigo = 'E618';

select *
  from vw_personal
 where c_encargado = '040'
   and situacion not in (
   select situacion
     from planilla10.t_situacion_cesado
   );

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
  from vw_personal
 where nombre like '%ISAIAS%';

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
 where id_evaluacion in (10996);

select *
  from evaluacion
 where id_evaluado = 'E41405'
 order by fecha desc;

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

select *
  from planilla10.tar_encarga
 where nombre like '%SOTOM%';

select *
  from planilla10.personal
 where encargado = '065'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

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

select *
  from cese_personal
 where id_personal = 'E017';



select id_proceso, ano, mes, id_personal, id_encargado, encargado, email_encargado
  from vw_proceso_puntualidad
 where ano = :p_ano
   and mes = :p_mes
 group by id_proceso, ano, mes, id_encargado, encargado, email_encargado, id_personal;

select * from proceso_puntualidad_pers;

select *
  from planilla10.tar_encarga
 where codigo = '062';

select h.id_proceso, h.id_periodo, extract(year from h.hasta) as ano
     , extract(month from h.hasta) as mes, d.id_personal, d.persona, d.id_encargado, d.encargado
     , p.email_encargado, d.tot_he_hr, d.hes25_fmt, d.hes35_fmt, d.hesdn_fmt, d.horas_libres
  from proceso_puntualidad h
       join proceso_puntualidad_pers d on h.id_proceso = d.id_proceso
       left join vw_personal p on d.id_personal = p.c_codigo;

-- vw_proceso_puntualidad
select h.id_proceso, h.id_periodo, extract(year from h.hasta) as ano
     , extract(month from h.hasta) as mes, d.id_personal, d.persona, d.id_encargado, d.encargado
     , e.c_codigo as cod_encargado, p.email_encargado, d.tot_he_hr, d.hes25_fmt, d.hes35_fmt
     , d.hesdn_fmt, d.horas_libres
  from proceso_puntualidad h
       join proceso_puntualidad_pers d on h.id_proceso = d.id_proceso
       left join vw_personal p on d.id_personal = p.c_codigo
       left join planilla10.tar_encarga e on d.id_encargado = e.codigo
 where extract(year from h.hasta) = 2024
   and extract(month from h.hasta) = 12;


select *
  from planilla10.tar_encarga
 where codigo = '034';


select *
  from planilla10.personal
 where c_codigo = 'E567';


select *
  from planilla10.personal
 where nombres like '%OMAR%';


select id_proceso, ano, mes, id_encargado, encargado, email_encargado, cod_encargado
  from vw_proceso_puntualidad
 where ano = 2025
   and mes = 1
 group by id_proceso, ano, mes, id_encargado, encargado, email_encargado, cod_encargado;


select id_log, accion, cod_id_pk, tabla, columna, old, new, fecha, usuario, ip, txt
  from log_auditoria;


select * from log_auditoria;


select *
  from permiso
 where numero = 69248;


select * from planilla10.t_area order by c_area;


select *
  from usuario_modulo
 where modulo = 'ACCIDENTES';

select *
  from planilla10.personal
 where apellido_paterno like '%JUAREZ%';

select *
  from planilla10.hr_personal
 where c_codigo = 'E1240';

select *
  from planilla10.tar_encarga
 where codigo = '077';

declare
  l_emails util.t_list := util.t_list();
begin
  l_emails := rrhh.all_bosses_mails_from_employee('E43137');
  for i in 1 .. l_emails.count loop
    dbms_output.put_line(l_emails(i));
  end loop;
end;

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
     where e.c_codigo = :p_codigo
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

select codigo, nombre, ecorreo
  from planilla10.tar_encarga
 where c_codigo in (
   select c_codigo from planilla10.personal where situacion < '8'
   )
   and c_codigo in (
   select codigo_trabajador
     from usuarios
    where usuario like case when :user in ('PEVISA', 'KCASTILLO') then '%' else :user end
   )
 order by 1;

select codigo_trabajador
  from usuarios
 where usuario like case when :user in ('PEVISA', 'KCASTILLO') then '%' else :user end;

select codigo, nombre, ecorreo
  from planilla10.tar_encarga
 where c_codigo in (
   select c_codigo from planilla10.personal where situacion < '8'
   )
   and ((:supermaestro = 'SI' and upper(usuario) like '%') or
        (upper(usuario) = :usuario));

select *
  from planilla10.personal
 where c_codigo in (
                    'E41830', 'E43400', 'E43495', 'E43563', 'E43664'
   );

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
    where usuario = :user and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = :modulo
   ) or :user in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and per.situacion not in ('8', '9')
 order by enc.nombre, per.apellido_paterno;

select *
  from vw_personal
 where nombre like '%JORGE ALBERTO%';

declare
  correos       util.t_list := util.t_list();
  l_correos_txt varchar2(32767);
begin
  correos := rrhh.all_bosses_mails_from_employee('E43708');

  correos.extend(1);
  correos(correos.count) := 'gthh@pevisa.com.pe';

  correos.extend(1);
  correos(correos.count) := 'icatalan@pevisa.com.pe';

  correos := set(correos);
  l_correos_txt := util.concat_list(correos, '; ');

--   dbms_output.put_line(l_correos_txt);
  for i in 1 .. correos.count loop
    dbms_output.put_line(l_correos_txt);
  end loop;
end;

select p.c_codigo, p.apellido_paterno || ' ' || p.apellido_materno || ', ' || p.nombres as nombre
     , p.c_cargo
     , c.descripcion as desc_cargo, p.seccion, s.nombre as desc_seccion, g.c_codigo as encargado
     , p.sexo
     , g.nombre as desc_encargado, h.local, l.descripcion as desc_local, p.f_ingreso, p.fnatal
     , d.num_doc as dni, i.descripcion as situacion, p.f_cese, p.conini, p.confin
     , trunc(months_between(sysdate, p.fnatal) / 12) as edad
     , trunc(months_between(sysdate, p.f_ingreso) / 12) || ' años' as tiempo_empresa
     , e.desc_perfil, e.ultimo_emo, e.proximo_emo, e.desc_perfil_covid, e.ultimo_covid
     , e.proximo_covid
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
    where usuario = :user and modulo = 'MATRIZ_PERSONAL'
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :user and id_modulo = 'MATRIZ_PERSONAL'
   ) or :user in (
   select usuario from usuario_modulo where modulo = 'MATRIZ_PERSONAL' and maestro = 'SI'
   ))
 order by 2;

select *
  from modulo
 where id_modulo = 'MATRIZ_PERSONAL';

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

select * from planilla10.tar_encarga;

-- Felipe Cruz E1198
select *
  from planilla10.personal
 where encargado = '068';

-- Ricardo Tovar E1199
select *
  from planilla10.personal
 where encargado = '071';

select *
  from usuarios
 where usuario = 'HREMUZGO';

select *
  from vw_personal
 where nombre like '%OMAR%';

select *
  from planilla10.personal
 where encargado = '068';

-- todos los empleados de un jefe
  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, o.email, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.hr_personal o on p.c_codigo = o.c_codigo
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
     where p.situacion not in (
       select s.codigo
         from planilla10.t_situacion_cesado s
       )
    )
     , autorizados as (
    select 'E567' as c_codigo
      from dual
    -- Puedes agregar más autorizados con UNION ALL si lo deseas
    )
     , jerarquia(c_codigo, nombres, apellido_paterno, c_jefe) as (
-- Empezamos desde el jefe indicado
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from empleados e
     where (:p_codemp in (
       select c_codigo
         from autorizados
       ))
        or e.c_codigo = :p_codemp
     union all
-- Buscamos todos los que tienen como jefe a alguien en la jerarquía actual
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from empleados e
           join jerarquia j
                on e.c_jefe = j.c_codigo
    )
select e.c_codigo, e.nombres, e.apellido_paterno
  from jerarquia e
--  where e.c_codigo != :p_codemp --> si no queremos que aparezca el jefe
 where e.apellido_paterno not in ('WOLFENZON', 'LEVY')
 order by e.apellido_paterno, e.nombres;


-- muestra todos los empleados debajo del arbol de una jefatura
-- si está autorizado puede ver todos los trabajadores asi no esten bajo su cargo
  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, o.email, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.hr_personal o on p.c_codigo = o.c_codigo
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
     where p.situacion not in (
       select s.codigo
         from planilla10.t_situacion_cesado s
       )
    )
     , autorizados as (
    select u.codigo_trabajador as c_codigo
      from usuario_modulo um
           join usuarios u on um.usuario = u.usuario
     where um.modulo = 'MATRIZ_PERSONAL'
       and um.supermaestro = 'SI'
    )
     , raiz as (
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from empleados e
     where (:p_codemp in (
       select c_codigo
         from autorizados
       ) or e.c_codigo = :p_codemp)
    )
     , jerarquia (c_codigo, nombres, apellido_paterno, c_jefe, nivel) as (
    select r.c_codigo, r.nombres, r.apellido_paterno, r.c_jefe, 1 as nivel
      from raiz r
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe, j.nivel + 1
      from empleados e
           join jerarquia j on e.c_jefe = j.c_codigo
     where e.c_codigo != j.c_codigo -- evita ciclos directos
    )
select j.c_codigo, j.nombres, j.apellido_paterno, e.email
  from jerarquia j
       join empleados e on j.c_codigo = e.c_codigo
--  where j.c_codigo != :p_codemp
 where j.apellido_paterno not in ('WOLFENZON', 'LEVY')
 order by j.nivel, j.apellido_paterno, j.nombres;


select u.codigo_trabajador
  from usuario_modulo um
       join usuarios u on um.usuario = u.usuario
 where um.modulo = 'MATRIZ_PERSONAL'
   and um.supermaestro = 'SI';

select *
  from usuario_modulo
 where modulo = 'MATRIZ_PERSONAL';

select *
  from usuarios
 where usuario = 'CNAVARRO';

-- VERSION PARA MATRIZ PERSONAL
-- muestra todos los empleados debajo del arbol de una jefatura
-- si está autorizado puede ver todos los trabajadores asi no esten bajo su cargo
  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, o.email, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.hr_personal o on p.c_codigo = o.c_codigo
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
     where ((p.situacion not in (
       select s.codigo
         from planilla10.t_situacion_cesado s
       ) and :p_cesado = 0) or :p_cesado = 1)
    )
     , autorizados as (
    select u.codigo_trabajador as c_codigo
      from usuario_modulo um
           join usuarios u on um.usuario = u.usuario
     where um.modulo = :p_modulo
       and um.supermaestro = 'SI'
    )
     , raiz as (
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from empleados e
     where (:p_codemp in (
       select c_codigo
         from autorizados
       ) or e.c_codigo = :p_codemp)
    )
     , jerarquia (c_codigo, nombres, apellido_paterno, c_jefe, nivel) as (
    select r.c_codigo, r.nombres, r.apellido_paterno, r.c_jefe, 1 as nivel
      from raiz r
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe, j.nivel + 1
      from empleados e
           join jerarquia j on e.c_jefe = j.c_codigo
     where e.c_codigo != j.c_codigo -- evita ciclos directos
    )
select j.c_codigo, j.nombres, j.apellido_paterno, j.c_jefe, j.nivel
  from jerarquia j;

begin
  sp_carga_personal_jefatura(p_codemp => 'E590', p_cesado => 1, p_modulo => 'MATRIZ_PERSONAL');
end;


select p.c_codigo, p.apellido_paterno || ' ' || p.apellido_materno || ', ' || p.nombres as nombre
     , p.c_cargo, c.descripcion as desc_cargo, p.seccion, s.nombre as desc_seccion
     , g.c_codigo as encargado, p.sexo, g.nombre as desc_encargado, h.local
     , l.descripcion as desc_local, p.f_ingreso, p.fnatal, d.num_doc as dni
     , i.descripcion as situacion, p.f_cese, p.conini, p.confin
     , trunc(months_between(sysdate, p.fnatal) / 12) as edad
     , trunc(months_between(sysdate, p.f_ingreso) / 12) || ' años' as tiempo_empresa
     , e.desc_perfil, e.ultimo_emo, e.proximo_emo, e.desc_perfil_covid, e.ultimo_covid
     , e.proximo_covid, e.desc_perfil_toxi, e.ultimo_toxi, e.proximo_toxi, u.talla_polo
     , u.talla_pantalon, u.talla_calzado
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
 where exists (
   select 1
     from tmp_codigo_empleado t
    where t.c_codigo = p.c_codigo
   )
 order by 2;

-- BACKUP
select p.c_codigo, p.apellido_paterno || ' ' || p.apellido_materno || ', ' || p.nombres as nombre
     , p.c_cargo
     , c.descripcion as desc_cargo, p.seccion, s.nombre as desc_seccion, g.c_codigo as encargado
     , p.sexo
     , g.nombre as desc_encargado, h.local, l.descripcion as desc_local, p.f_ingreso, p.fnatal
     , d.num_doc as dni, i.descripcion as situacion, p.f_cese, p.conini, p.confin
     , trunc(months_between(sysdate, p.fnatal) / 12) as edad
     , trunc(months_between(sysdate, p.f_ingreso) / 12) || ' años' as tiempo_empresa
     , e.desc_perfil, e.ultimo_emo, e.proximo_emo, e.desc_perfil_covid, e.ultimo_covid
     , e.proximo_covid
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
    where usuario = user and modulo = :global.modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = user and id_modulo = :global.modulo
   ) or user in (
   select usuario from usuario_modulo where modulo = :global.modulo and maestro = 'SI'
   ))
 order by 2;

select * from planilla10.tar_encarga;

select *
  from planilla10.personal
 where encargado = '069';

-- E012
-- E42373
-- E1211
-- E43788
-- E43795
-- E1241
-- E1242
-- E1226
-- E43772
-- E43776
-- E43777

select *
  from planilla10.personal
 where c_codigo = 'E1210';

select *
  from planilla10.personal
 where apellido_paterno like '%VASQUEZ%';

select *
  from planilla10.personal
 where nombres like '%ESTHER%';

select *
  from usuario_modulo
 where modulo = 'PERMISO'
   and usuario = 'JCABEZAS';

select *
  from usuario_modulo_alterno
 where id_alterno = 'JQUISPEB'
   and id_modulo = 'PERMISO';

declare
  l_codigo varchar2(10);
begin
  l_codigo := api_usuarios.onerow(:usuario).codigo_trabajador;
  sp_carga_personal_jefatura(p_codemp => l_codigo, p_cesado => 0, p_modulo => 'PERMISO');
  commit;
end;

select * from tmp_codigo_empleado;

select per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.c_codigo, per.seccion as cod_seccion, s.nombre as seccion, enc.nombre as encargado
  from planilla10.personal per
     , planilla10.tar_encarga enc
     , planilla10.tar_secc s
 where per.encargado = enc.codigo
   and per.seccion = s.codigo(+)
   and (upper(enc.usuario) in (
   select usuario
     from usuario_modulo
    where usuario = :usuario and modulo = :modulo
    union
   select id_usuario
     from usuario_modulo_alterno
    where id_alterno = :usuario and id_modulo = :modulo
   ) or :usuario in (
   select usuario from usuario_modulo where modulo = :modulo and maestro = 'SI'
   ))
   and exists (
   select 1
     from tmp_codigo_empleado t
    where t.c_codigo = per.c_codigo
   )
 order by enc.nombre, per.apellido_paterno;

select *
  from usuario_modulo_alterno
 where id_alterno = 'JQUISPEB';

select u.codigo_trabajador as c_codigo
  from usuario_modulo um
       join usuarios u on um.usuario = u.usuario
 where um.modulo = :p_modulo
   and um.supermaestro = 'SI';

select *
  from planilla10.tar_encarga
 where nombre like '%CRUZ%';

select *
  from planilla10.personal
 where c_codigo = 'E1257';

select *
  from planilla10.personal
 where c_codigo = 'E1137';

select *
  from planilla10.tar_encarga
 where c_codigo = 'E1137';

-- Saulo Vargas
select *
  from planilla10.personal
 where encargado = '062'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, o.email, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.hr_personal o on p.c_codigo = o.c_codigo
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
     where ((p.situacion not in (
       select s.codigo
         from planilla10.t_situacion_cesado s
       ) and :p_cesado = 0) or :p_cesado = 1)
    )
     , autorizados as (
    select u.codigo_trabajador as c_codigo
      from usuario_modulo um
           join usuarios u on um.usuario = u.usuario
     where um.modulo = :p_modulo
       and um.supermaestro = 'SI'
    )
     , raiz as (
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from empleados e
     where (:p_codemp in (
       select c_codigo
         from autorizados
       ) or e.c_codigo = :p_codemp)
    )
     , jerarquia (c_codigo, nombres, apellido_paterno, c_jefe, nivel) as (
    select r.c_codigo, r.nombres, r.apellido_paterno, r.c_jefe, 1 as nivel
      from raiz r
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe, j.nivel + 1
      from empleados e
           join jerarquia j on e.c_jefe = j.c_codigo
     where e.c_codigo != j.c_codigo -- evita ciclos directos
    )
select j.c_codigo
  from jerarquia j
 where j.c_codigo = 'E4318';

-- buscar a E4318 Pedro Arroyo

select multiplo.superior(21, 7) from dual;

begin
  if multiplo.es(21, 7) then
    dbms_output.put_line('Es multiplo');
  else
    dbms_output.put_line('No es multiplo');
  end if;
end;

select sysdate from dual;

select * from vw_vacaciones;

select *
  from planilla10.t_cargo
 where descripcion like '%PICK%';

select *
  from planilla10.personal
 where c_cargo = 'OPK'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select *
  from vw_personal
 where c_cargo = 'OPK'
   and situacion not in (
   select *
     from planilla10.t_situacion_cesado
   );

select * from caja_chica_serie;

select *
  from usuarios_caja_chica
 where usuario = 'DACOSTA';

select *
  from usuarios_caja_chica
 where serie = 7
 order by usuario;

select per.c_codigo
     , per.apellido_paterno || ' ' || per.apellido_materno || ', ' || per.nombres as nombre
     , per.conini
     , per.confin
     , per.clase
  from planilla10.personal per
     , planilla10.tar_encarga enc
 where per.encargado = enc.codigo
   and enc.c_codigo = 'E567'
   and per.situacion not in ('8', '9')
   and per.c_codigo not in (
   select id_personal
     from cese_personal
   )
   and to_char(per.confin, 'MM') = to_char(sysdate, 'MM')
--    and pevisa.sf_eval(per.c_codigo, trunc(last_day(sysdate))) is null
 order by per.apellido_paterno;

select sf_eval('E537', trunc(last_day(sysdate))) from evaluacion;

select *
  from planilla10.personal
 where c_codigo = 'E567';

select listagg(id_evaluacion, ' / ') within group (order by id_evaluacion)
  from evaluacion
 where id_evaluado = p_id_evaluado
   and periodo_al = p_periodo_al;



  with empleados as (
    select p.c_codigo, p.nombres, p.apellido_paterno, o.email, j.c_codigo as c_jefe
      from planilla10.personal p
           left join planilla10.hr_personal o on p.c_codigo = o.c_codigo
           left join planilla10.tar_encarga e on p.encargado = e.codigo
           left join planilla10.personal j on e.c_codigo = j.c_codigo
     where ((p.situacion not in (
       select s.codigo
         from planilla10.t_situacion_cesado s
       ) and :p_cesado = 0) or :p_cesado = 1)
    )
     , autorizados as (
    select u.codigo_trabajador as c_codigo
      from usuario_modulo um
           join usuarios u on um.usuario = u.usuario
     where um.modulo = :p_modulo
       and um.supermaestro = 'SI'
    )
     , raiz as (
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from empleados e
     where (:p_codemp in (
       select c_codigo
         from autorizados
       ) or e.c_codigo = :p_codemp)
    )
     , jerarquia (c_codigo, nombres, apellido_paterno, c_jefe, nivel) as (
    select r.c_codigo, r.nombres, r.apellido_paterno, r.c_jefe, 1 as nivel
      from raiz r
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe, j.nivel + 1
      from empleados e
           join jerarquia j on e.c_jefe = j.c_codigo
     where e.c_codigo != j.c_codigo -- evita ciclos directos
    )
select j.c_codigo
  from jerarquia j;

select *
  from vw_personal
 where c_codigo in (
                    'E1211', 'E43653', 'E43785', 'E43758', 'E43816', 'E43817', 'E43130', 'E43031',
                    'E43807', 'E43755', 'E43485', 'E43796', 'E43750', 'E43164', 'E43200', 'E43553',
                    'E43648', 'E43470', 'E43635', 'E43632', 'E43631', 'E43763', 'E43621', 'E43599',
                    'E43610', 'E43577', 'E43823', 'E43781', 'E43780', 'E43779', 'E43731', 'E43732',
                    'E43733', 'E42595', 'E43006', 'E42847', 'E42955', 'E42947', 'E42940', 'E42414',
                    'E42931', 'E41996', 'E41652', 'E41830', 'E4785', 'E41316', 'E4476', 'E4376',
                    'E4347', 'E4312', 'E41311'
   );

select *
  from vw_personal
 where nombre like '%MECHATO%';

select *
  from usuario_modulo_alterno
 where id_usuario = 'ISAIAS_MECHATO';

select *
  from usuario_modulo_alterno
 where id_alterno = 'ISAIAS_MECHATO';

select *
  from usuarios
 where usuario = 'ISAIAS_MECHATO';

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
   and exists (
   select 1
     from pevisa.tmp_codigo_empleado t
    where t.c_codigo = per.c_codigo
   )
   and per.c_codigo != :c_codigo
   and per.situacion not in ('8', '9')
 order by enc.nombre, per.apellido_paterno;

begin
  sp_carga_personal_jefatura(p_codemp => :c_codigo, p_cesado => 1, p_modulo => 'PERMISO');
end;


select * from tmp_codigo_empleado;


select *
  from usuarios
 where usuario = 'ISAIAS_MECHATO';


select *
  from usuarios
 where usuario = '';

-- 08A puesto anterior
select *
  from bono_obrero_puesto
 where id_bono_obrero = 53;

select *
  from vw_personal
 where c_codigo = 'E1325';

-- 08A puesto anterior
select *
  from bono_oa_puesto
 where cod_bono = 5;

select *
  from planilla10.personal
 where c_cargo in ('17AD', 'AXAM', 'CARM')
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select *
  from vw_personal
 where c_area = '004'
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
   and c_codigo in ('E41958', 'E41260', 'E4923');

select *
  from personal_armado_produccion;

select distinct c_cargo
  from planilla10.personal
 where c_codigo in (
                    'E42206', 'E42406', 'E42412', 'E42413', 'E42449', 'E42546', 'E42599', 'E42586',
                    'E42598', 'E43111', 'E42300', 'E42259', 'E42257', 'E42324', 'E43762', 'E43371',
                    'E43391', 'E43343', 'E43432', 'E43352', 'E43362', 'E43523', 'E43524', 'E43526',
                    'E43746', 'E43509', 'E43294', 'E43263', 'E43265', 'E43701', 'E43723', 'E43507',
                    'E43228', 'E43550', 'E43350', 'E41260', 'E41761', 'E41796', 'E41893', 'E41956',
                    'E41958', 'E42015', 'E42016', 'E42022', 'E43442', 'E43892', 'E42124', 'E42130',
                    'E42131', 'E42160', 'E42161', 'E42164', 'E4458', 'E4901', 'E4923', 'E4998',
                    'E43887', 'E43886', 'E43872  ', 'E43870', 'E43858', 'E43853', 'E43893',
                    'E43894', 'E43898', 'E43899', 'E43900', 'E43901', 'E43902', 'E43903', 'E43904',
                    'E43905', 'E43908', 'E43909', 'E43910', 'E43912', 'E42909', 'E42962', 'E43018',
                    'E43011', 'E43053', 'E43077', 'E43100', 'E43154', 'E43153', 'E43188', 'E43167',
                    'E43173', 'E43178', 'E43179', 'E43183', 'E43180', 'E43190', 'E43715', 'E43555',
                    'E43840', 'E43837', 'E43399', 'E42634', 'E42638', 'E42639', 'E42683', 'E42699',
                    'E42700', 'E42719', 'E42791', 'E42808', 'E42809', 'E42814', 'E42821', 'E42822',
                    'E42848'
   )
   and situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );


select *
  from planilla10.t_cargo
 where c_cargo in (
                   'ENAR', 'AXAM', 'AXPLT', '17AD', 'SUAL', 'OPAL', 'CARM'
   );

select *
  from planilla10.t_cargo
 where descripcion like '%PROGRAMADOR%';

select *
  from vw_personal
 where c_cargo = 'AP'
 order by f_ingreso desc;

select *
  from kardex_g
 where cod_alm = '30'
   and tp_transac = '18'
   and serie = 2
   and numero = 639398
 order by ing_sal desc, numero_pguia;

select *
  from planilla10.v_contratos_encargados
 where nombre like '%QUISPE%';

select *
  from planilla10.tar_encarga
 where nombre like '%QUISPE%';


select r.id_cargo, p.desc_cargo, p.c_codigo, p.nombre, p.c_encargado, p.desc_encargado, p.turno
     , case p.turno
         when 1 then 'DIA'
         when 2 then 'TARDE'
         when 3 then 'NOCHE'
       end as dsc_turno
     , case p.turno
         when 1 then r.bono_dia
         when 2 then r.bono_tarde
         when 3 then r.bono_noche
         else 0
       end as bono
  from vw_personal p
       join responsabilidad_cargo r on p.c_cargo = r.id_cargo
 where p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   )
   and not exists (
   select id_personal
     from bono_obrero_excluye e
          join bono_obrero_excluye_modulo m on e.id_excluye = m.id_excluye
    where periodo_ano = 2026
      and periodo_mes = 2
      and id_personal = p.c_codigo
      and id_bono = 2
   )
 order by desc_cargo, desc_encargado, nombre;

select *
  from prod_grupo
 where id_grupo = '';

select *
  from prod_megagrupo
 where id_megagrupo = 'M010';

-- Con tabla relación para unir a subgrupo
select sl.id_linea, gs.id_subgrupo, s.id_subgrupo, g.id_grupo, g.dsc_grupo, m.id_megagrupo
     , m.dsc_megagrupo
  from prod_subgrupo_linea_rel sl
       join prod_grupo_subgrupo_rel gs on sl.id_subgrupo = gs.id_subgrupo
       join prod_megagrupo_grupo_rel mg
            on gs.id_megagrupo = mg.id_megagrupo
              and gs.id_grupo = mg.id_grupo
       join prod_subgrupo s on gs.id_subgrupo = s.id_subgrupo
       join prod_grupo g on mg.id_grupo = g.id_grupo
       join prod_megagrupo m on mg.id_megagrupo = m.id_megagrupo
 where m.id_megagrupo = 'M010'
   and g.id_grupo = 'G035'
 order by id_megagrupo, id_grupo, s.id_subgrupo, id_linea;
