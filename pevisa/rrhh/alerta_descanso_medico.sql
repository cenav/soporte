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
     where e.c_codigo = 'E1084'
     union all
    select e.c_codigo, e.nombres, e.apellido_paterno, e.c_jefe
      from jerarquia b
           join empleados e on b.c_jefe = e.c_codigo
     where e.c_codigo != e.c_jefe
    )
select b.c_jefe, e.nombres, e.apellido_paterno, e.email
  from jerarquia b
       join empleados e on b.c_jefe = e.c_codigo;
