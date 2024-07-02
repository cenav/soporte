select r.apellido_paterno || ' ' || r.apellido_materno || ', ' || r.nombres as nombre_personal
     , n.nombre as nombre_jefe, n.ecorreo as correo_jefe
     , to_char(e.desde, 'DD/MM/YYYY') as fecha, to_char(e.desde, 'HH:MI AM') as hora
     , cp.descripcion as concepto, e.usuario_creacion
  from permiso e
       join planilla10.personal r on e.id_personal = r.c_codigo
       join planilla10.tar_encarga n on r.encargado = n.codigo
       join concepto_permiso cp on e.id_concepto = cp.id_concepto
 where e.serie = 1
   and e.numero = 64302;

select p.c_codigo, p.nombres, p.apellido_paterno, p.encargado
  from planilla10.personal p
       left join planilla10.tar_encarga e on p.encargado = e.codigo
 where p.c_codigo = 'E42489';

select p.c_codigo, p.nombres, p.apellido_paterno, p.encargado, j.nombres, j.apellido_paterno
  from planilla10.personal p
       left join planilla10.tar_encarga e on p.encargado = e.codigo
       left join planilla10.personal j on e.c_codigo = j.c_codigo
 where p.situacion not in (
   select c.codigo
     from planilla10.t_situacion_cesado c
   );


-- todos los jefes de un empleado
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
     where e.c_codigo = 'E43337'
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from jerarquia b
           join empleados e on b.c_jefe = e.c_codigo
     where e.c_codigo != e.c_jefe
    )
select b.c_jefe, e.nombres, e.apellido_paterno, e.email
  from jerarquia b
       join empleados e on b.c_jefe = e.c_codigo
 where e.apellido_paterno not in ('WOLFENZON');

-- jefatura que no tiene correo
select e.c_codigo, e.nombre, e.ecorreo
  from planilla10.tar_encarga e
       join planilla10.personal p on e.c_codigo = p.c_codigo
       left join planilla10.hr_personal h on p.c_codigo = h.c_codigo
 where h.email is null
   and p.situacion not in (
   select codigo
     from planilla10.t_situacion_cesado
   );

select *
  from planilla10.hr_personal
 where c_codigo in (
                    'E4526', 'E957', 'E1104', 'E1138', 'E1137', 'E1139'
   );


-- declare
--   l_rows pls_integer := 0;
-- begin
--   for r in (
--     select e.c_codigo, e.nombre, e.ecorreo
--       from planilla10.tar_encarga e
--            join planilla10.personal p on e.c_codigo = p.c_codigo
--            left join planilla10.hr_personal h on p.c_codigo = h.c_codigo
--      where h.email is null
--        and p.situacion not in (
--        select codigo
--          from planilla10.t_situacion_cesado
--        )
--     )
--   loop
--     update planilla10.hr_personal
--        set email = r.ecorreo
--      where c_codigo = r.c_codigo;
--
--     l_rows := l_rows + sql%rowcount;
--   end loop;
--   dbms_output.put_line(l_rows);
-- end;

declare
  subtype t_email is varchar2(32767);
  type t_correo is table of t_email;
  l_correos t_correo := t_correo();
begin
  for r in (
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
         where e.c_codigo = 'E43337'
         union all
        select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
          from jerarquia b
               join empleados e on b.c_jefe = e.c_codigo
         where e.c_codigo != e.c_jefe
        )
    select b.c_jefe, e.nombres, e.apellido_paterno, e.email
      from jerarquia b
           join empleados e on b.c_jefe = e.c_codigo
     where e.apellido_paterno not in ('WOLFENZON')
    )
  loop
    l_correos.extend(1);
    l_correos(l_correos.count) := r.email;
  end loop;

  l_correos.extend(1);
  l_correos(l_correos.count) := 'icatalan@pevisa.com.pe';
  l_correos := set(l_correos);

  for i in l_correos.first .. l_correos.last loop
    dbms_output.put_line(l_correos(i));
  end loop;
end;


declare
  l_correos     rrhh.t_correo := rrhh.t_correo();
  l_lista_envio varchar2(32767);

  function to_email_list(
    p_mails rrhh.t_correo
  ) return varchar2 is
    l_list varchar2(32767);
  begin
    for i in p_mails.first .. p_mails.last loop
      if l_list is not null then
        l_list := l_list || '; ' || p_mails(i);
      else
        l_list := p_mails(i);
      end if;
    end loop;

    return l_list;
  end;

begin
  l_correos := rrhh.all_bosses_mails_from_employee('E43337');

  l_correos.extend(1);
  l_correos(l_correos.count) := 'icatalan@pevisa.com.pe';
  l_correos := set(l_correos);

  for i in l_correos.first .. l_correos.last loop
    dbms_output.put_line(l_correos(i));
  end loop;

  l_lista_envio := to_email_list(l_correos);
  dbms_output.put_line(l_lista_envio);
end;

select *
  from permiso
 where numero = 64347;

select *
  from concepto_permiso
 where id_concepto = 'DME';

select * from tipo_concepto_permiso;


select * from prevencionista;